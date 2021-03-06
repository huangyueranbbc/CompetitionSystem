package com.hyr.hubei.polytechnic.university.competition.system.cxf;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * 管理配置信息的（读取配置文件）
 * 
 * @author tyg
 * @category 配置信息
 * 
 */
public class Configuration {

	private static int pageSize = 10;
	private static String fileCachePath = "d:/FileUploadCache";

	static {
		InputStream in = null;
		try {

			// 加载default.properties配置文件
			Properties props = new Properties();
			in = Configuration.class.getClassLoader().getResourceAsStream("default.properties");
			props.load(in);

			// 获取配置的值
			pageSize = Integer.parseInt(props.getProperty("pageSize"));
			fileCachePath = props.getProperty("fileCachePath");

		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			if (in != null) {
				try {
					in.close();
				} catch (IOException e) {
					throw new RuntimeException(e);
				}
			}
		}
	}

	public static int getPageSize() {
		return pageSize;
	}

	public static void setPageSize(int pageSize) {
		Configuration.pageSize = pageSize;
	}

	public static String getFileCachePath() {
		return fileCachePath;
	}

	public static void setFileCachePath(String fileCachePath) {
		Configuration.fileCachePath = fileCachePath;
	}

}
