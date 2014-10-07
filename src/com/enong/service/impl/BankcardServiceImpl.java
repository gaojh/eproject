package com.enong.service.impl;

import java.util.List;

import org.nutz.dao.Cnd;
import org.nutz.dao.Dao;
import org.nutz.ioc.annotation.InjectName;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.trans.Molecule;
import org.nutz.trans.Trans;

import com.enong.bo.EAddress;
import com.enong.bo.EBankcard;
import com.enong.service.interfaces.BankcardService;
import com.enong.utils.Cons;

@IocBean
@InjectName("bankcardServiceImpl")
public class BankcardServiceImpl implements BankcardService {

	@Inject
	Dao dao;

	@Override
	public EBankcard findBankcardById(long id) {
		EBankcard card = dao.fetch(EBankcard.class, Cnd.where("id", "=", id)
				.and("state", "=", Cons.state.USE));
		return card;
	}

	@Override
	public List<EBankcard> findBankcardsByUser(long userId) {
		List<EBankcard> cards = dao.query(
				EBankcard.class,
				Cnd.where("userId", "=", userId)
						.and("state", "=", Cons.state.USE).desc("isDefault")
						.desc("id"));
		return cards;
	}

	@Override
	public EBankcard findDefaultBankcard(long userId) {
		return dao.fetch(
				EBankcard.class,
				Cnd.where("isDefault", "=", Cons.bool.YES).and("userId", "=",
						userId));
	}

	@Override
	public int findBankcardCountByUser(long userId) {
		int number = dao
				.count(EBankcard.class,
						Cnd.where("userId", "=", userId).and("state", "=",
								Cons.state.USE));
		return number;
	}

	@Override
	public EBankcard addBankcard(final EBankcard bankcard) {
		Molecule<EBankcard> mc = new Molecule<EBankcard>() {
			public void run() {

				if (bankcard.getIsDefault().equals(Cons.bool.YES)) {
					EBankcard defaultBankcard;

					defaultBankcard = findDefaultBankcard(bankcard.getUserId());
					defaultBankcard.setIsDefault(Cons.bool.NO);
					dao.update(defaultBankcard);
				}
				setObj(dao.insert(bankcard));
			}
		};
		Trans.exec(mc);

		return mc.getObj();
	}

	@Override
	public int updateBankcard(final EBankcard bankcard) {
		Molecule<Integer> mc = new Molecule<Integer>() {
			public void run() {

				if (bankcard.getIsDefault().equals(Cons.bool.YES)) {
					EBankcard defaultBankcard;

					defaultBankcard = findDefaultBankcard(bankcard.getUserId());
					defaultBankcard.setIsDefault(Cons.bool.NO);
					dao.update(defaultBankcard);
				}
				setObj(dao.update(bankcard));
			}
		};
		Trans.exec(mc);

		return mc.getObj();
	}

	@Override
	public int removeBankcard(EBankcard bankcard) {
		// TODO Auto-generated method stub
		return dao.delete(bankcard);
	}

}
