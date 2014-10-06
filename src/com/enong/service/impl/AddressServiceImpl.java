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
import com.enong.service.interfaces.AddressService;
import com.enong.utils.Cons;

@IocBean
@InjectName("addressServiceImpl")
public class AddressServiceImpl implements AddressService {

	@Inject
	Dao dao;

	@Override
	public EAddress findAddressById(long id) {
		EAddress address = dao.fetch(EAddress.class, Cnd.where("id", "=", id)
				.and("state", "=", Cons.state.USE));
		dao.fetchLinks(address, "dist\\d");
		return address;
	}

	@Override
	public List<EAddress> findAddressByUser(long userId) {
		List<EAddress> addresses = dao.query(
				EAddress.class,
				Cnd.where("userId", "=", userId)
						.and("state", "=", Cons.state.USE).desc("isDefault")
						.desc("id"));
		dao.fetchLinks(addresses, "dist\\d");
		return addresses;
	}

	@Override
	public EAddress addAddress(final EAddress address) {

		Molecule<EAddress> mc = new Molecule<EAddress>() {
			public void run() {

				if (address.getIsDefault().equals(Cons.bool.YES)) {
					EAddress defaultAddress;

					defaultAddress = findDefaultAddress();
					defaultAddress.setIsDefault(Cons.bool.NO);
					dao.update(defaultAddress);
				}
				setObj(dao.insert(address));
			}
		};
		Trans.exec(mc);

		return mc.getObj();
	}

	@Override
	public int UpdateAddress(final EAddress address) {
		Molecule<Integer> mc = new Molecule<Integer>() {
			public void run() {

				if (address.getIsDefault().equals(Cons.bool.YES)) {
					EAddress defaultAddress;

					defaultAddress = findDefaultAddress();
					defaultAddress.setIsDefault(Cons.bool.NO);
					dao.update(defaultAddress);
				}
				setObj(dao.update(address));
			}
		};
		Trans.exec(mc);

		return mc.getObj();
	}

	@Override
	public int removeAddress(EAddress address) {
		// TODO Auto-generated method stub
		return dao.delete(address);
	}

	@Override
	public EAddress findDefaultAddress() {
		return dao.fetch(EAddress.class,
				Cnd.where("isDefault", "=", Cons.bool.YES));
	}

	@Override
	public int getAddressCountByUser(long userId) {
		int number = dao.count(EAddress.class, Cnd.where("userId", "=", userId)
				.and("state", "=", Cons.state.USE));
		return number;
	}
}
