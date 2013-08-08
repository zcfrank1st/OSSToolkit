package com.oss.operations;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

import org.apache.commons.codec.digest.DigestUtils;

import com.aliyun.openservices.oss.OSSClient;
import com.aliyun.openservices.oss.model.ObjectMetadata;
import com.aliyun.openservices.oss.model.PutObjectResult;

public class Upload implements Runnable{
	private OSSClient client = null;
	private File f;
	private String bucketName = "";
	private String key = "";
	private String tag = "";
	
	public Upload(OSSClient client, File f, String bucketName, String key){
		this.client = client;
		this.f = f;
		this.bucketName = bucketName;
		this.key = key;
	}

	@Override
	public void run() {
		if (key == "" || key == null){
			// ʲô������
		}else{
			InputStream content = null;;
			try {
				content = new FileInputStream(f);
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}
			
			ObjectMetadata meta = new ObjectMetadata();
			meta.setContentLength(f.length());
			
			PutObjectResult result = client.putObject(bucketName, key, content, meta);
			
			tag = result.getETag();
			try {
				if (tag == DigestUtils.md5Hex(new FileInputStream(f))){
					f.delete();
				}
			} catch (FileNotFoundException e) {
				System.out.println("dsdsd");
			} catch (IOException e) {
				System.out.println("sdsdsd");
			}
			}
		}
	
}