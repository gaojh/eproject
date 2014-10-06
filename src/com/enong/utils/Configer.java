package com.enong.utils;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class Configer {

	private static ConcurrentHashMap<String, ConcurrentHashMap<String, Object>> map = new ConcurrentHashMap<String, ConcurrentHashMap<String, Object>>();

	public static void addConfig(String type, String key, Object value) {
		if (!map.containsKey(type)) {
			ConcurrentHashMap<String, Object> tmp = new ConcurrentHashMap<String, Object>();
			tmp.put(key, value);
			map.put(type, tmp);
		}else{
			ConcurrentHashMap<String, Object> tmp = map.get(type);
			tmp.put(key, value);
		}
	}

	public static Map<String, Object> getConfigMap(String type) {
		return map.get(type);
	}

	public static Object getConfigMapValue(String type, String key) {
		return map.get(type).get(key);
	}
}
