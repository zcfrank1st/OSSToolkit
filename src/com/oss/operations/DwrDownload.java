package com.oss.operations;

import java.lang.reflect.Method;


public class DwrDownload {
	
		public void openURLs(String[] url) {
			try {
				browse(url);
			} catch (Exception e) {
			}
		}

		private void browse(String[] url) throws Exception {
			for(int i=0; i<=url.length-1; i++){
				// ��ȡ����ϵͳ������
				String osName = System.getProperty("os.name", "");
				if (osName.startsWith("Mac OS")) {
					// ƻ��
					Class<?> fileMgr = Class.forName("com.apple.eio.FileManager");
					Method openURL = fileMgr.getDeclaredMethod("openURLs",
						new Class[] { String.class });
					openURL.invoke(null, new Object[] { url[i] });
				} else if (osName.startsWith("Windows")) {
					// windows
					Runtime.getRuntime().exec(
						"rundll32 url.dll,FileProtocolHandler " + url[i]);
				} else {
				// Unix or Linux
					String[] browsers = { "firefox", "opera", "konqueror", "epiphany",
						"mozilla", "netscape","chrome" };
					String browser = null;
					for (int count = 0; count < browsers.length && browser == null; count++)
					// ִ�д��룬��brower��ֵ��������
					// ������������̴����ɹ��ˣ�==0�Ǳ�ʾ����������
						if (Runtime.getRuntime()
							.exec(new String[] { "which", browsers[count] })
							.waitFor() == 0)
							browser = browsers[count];
					if (browser == null)
						throw new Exception("Could not find web browser");
					else
						// ���ֵ�������Ѿ��ɹ��ĵõ���һ�����̡�
						Runtime.getRuntime().exec(new String[] { browser, url[i] });
			}
			}
		}
}

