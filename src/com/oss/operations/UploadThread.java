package com.oss.operations;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;

import com.aliyun.openservices.oss.OSSClient;
import com.aliyun.openservices.oss.model.ObjectMetadata;
import com.aliyun.openservices.oss.model.PutObjectResult;
// FIXME 改进实现断点续传功能
public class UploadThread implements Runnable{
	private OSSClient client = null;
	private String path = "";
	private String bucketName = "";
	private String key = "";
	
	public UploadThread(OSSClient client, String path, String bucketName, String key){
		this.client = client;
		this.path = path;
		this.bucketName = bucketName;
		this.key = key;
	}
	
	@Override
	public void run() {
		File f = new File(path);
		InputStream content = null;;
		try {
			content = new FileInputStream(f);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		
		ObjectMetadata meta = new ObjectMetadata();
		meta.setContentLength(f.length());
		
		@SuppressWarnings("unused")
		PutObjectResult result = client.putObject(bucketName, key, content, meta);

	}
	
}