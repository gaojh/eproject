package com.enong.utils;

public class Cons {

	public static class session {
		public static String USER = "ENONG_USER";
		public static String COOKIE = "ENONG_GOODIS_COOKIE_";
	}

	public static class userType {
		public static String NORMAL = "normal";
		public static String ADMIN = "admin";
	}

	public static class userState {
		public static String NORMAL = "U";
	}

	public static class orderState {
		public static String WAIT_FOR_PAYMENT = "P";
		public static String WAIT_FOR_CONFIRM = "C";
		public static String HAVE_CONFIRM = "H";
		public static String SEND_OUT_GOODS = "S";
		public static String ORDER_FINSH = "F";
		public static String ORDER_CANCEL = "E";
	}

	public static class balanceSourceType {
		public static String DGFX = "订购返现";
		public static String THTK = "退货退款";
	}

	public static class balancePaymentType {
		public static String XJGQ = "现金过期";
		public static String DDDK = "订单抵扣";
		public static String XJTX = "现金提现";
	}

	public static class couponsSourceType {
		public static String ZCZS = "注册赠送";
		public static String XXFK = "信息反馈";
		public static String GMDZQ = "购买电子券";
	}

	public static class couponsPaymentType {
		public static String DGSY = "订购使用";
		public static String GQZJF = "过期转积分";
	}

	public static class scoreSourceType {
		public static String DGZS = "订购赠送";
		public static String YEZH = "余额转化";
	}

	public static class scorePaymentType {
		public static String DDDK = "订单抵扣";
	}

	public static class state {
		public static String USE = "U";
		public static String DELETE = "D";
		public static String ERROR = "E";
		public static String WAITE = "W";
	}

	public static class bool {
		public static String YES = "Y";
		public static String NO = "N";
	}

	public static class result {
		public static short SUCCESS = 1;
		public static short FAILED = 0;
		public static short OTHER = 2;
	}

	public static class address {
		public static int MAX = 20;
	}

}
