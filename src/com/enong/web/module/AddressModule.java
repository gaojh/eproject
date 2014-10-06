package com.enong.web.module;

import java.util.List;

import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.adaptor.JsonAdaptor;
import org.nutz.mvc.annotation.AdaptBy;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Attr;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import com.enong.bo.EAddress;
import com.enong.bo.EDistrict;
import com.enong.bo.EUser;
import com.enong.service.interfaces.AddressService;
import com.enong.service.interfaces.DistrictService;
import com.enong.utils.Cons;
import com.enong.utils.JsonResult;
import com.enong.utils.UtilDate;

@IocBean
@At("/address")
public class AddressModule {

	private static Log log = Logs.getLog(UserModule.class);

	@Inject("refer:addressServiceImpl")
	AddressService addressService;

	@Inject("refer:districtServiceImpl")
	DistrictService districService;

	@At("/add")
	@AdaptBy(type = JsonAdaptor.class)
	@Ok("json")
	public JsonResult addAddress(@Attr("ENONG_USER") EUser user,
			EAddress address) {
		if (user == null) {
			return new JsonResult(Cons.result.FAILED, "请先登录");
		}
		if (address == null) {
			return new JsonResult(Cons.result.FAILED, "内容为空");
		}

		int number = addressService.getAddressCountByUser(user.getId());
		if (number >= Cons.address.MAX) {
			return new JsonResult(Cons.result.FAILED, "您最多只能拥有"
					+ Cons.address.MAX + "个收货地址！");
		}

		log.debug("保存收货地址...");
		address.setUserId(user.getId());
		address.setState(Cons.state.USE);
		address.setCreateDate(UtilDate.getDateFormatter());

		addressService.addAddress(address);

		log.debug("保存收货地址成功...");

		return new JsonResult(Cons.result.SUCCESS, "操作成功");
	}

	@At("/update")
	@AdaptBy(type = JsonAdaptor.class)
	@Ok("json")
	public JsonResult updateAddress(@Attr("ENONG_USER") EUser user,
			EAddress address) {

		addressService.UpdateAddress(address);

		return new JsonResult(Cons.result.SUCCESS, "操作成功");

	}

	@At("/get")
	@Ok("json")
	public JsonResult getAddress(long id) {
		EAddress address = addressService.findAddressById(id);
		return new JsonResult(Cons.result.SUCCESS, "操作成功", address);
	}

	@At("/delete")
	@Ok("json")
	public JsonResult deleteAddress(long id) {
		EAddress ad = new EAddress();
		ad.setId(id);
		addressService.removeAddress(ad);
		return new JsonResult(Cons.result.SUCCESS, "操作成功");
	}

	@At("/loadDistrict")
	@Ok("json")
	public JsonResult loadDistrict(@Param("parentId") long parentId) {
		int parentLevel = 0;
		int subLevel;
		// 省级无parent
		if (parentId != -1) {
			// 获取当前地区级别
			EDistrict parentDist = districService.findDistrictById(parentId);

			if (parentDist == null) {
				return new JsonResult(Cons.result.FAILED, "所选地区信息错误");
			}
			parentLevel = parentDist.getLevel();
		}
		List<EDistrict> districts = districService
				.findDistrictByParentId(parentId);

		if (districts == null || districts.size() < 1) {
			return new JsonResult(Cons.result.FAILED, "没有找到下级地区");
		}
		subLevel = districts.get(0).getLevel();
		// 判断上下级级别差距，返回不同code供前段处理，针对北京等直辖市
		if (subLevel - parentLevel > 1) {
			return new JsonResult(Cons.result.OTHER, "加载成功", districts);
		}
		return new JsonResult(Cons.result.SUCCESS, "加载成功", districts);
	}

}
