package com.oss.operations;

import com.aliyun.openservices.oss.OSSClient;


public class RenameThread implements Runnable{
	private OSSClient cli = null;
	private String bucketName = "";
	private String key = "";
	private String newKey = "";
	
	public RenameThread(OSSClient client, String bucket, String key, String newKey){
		this.cli = client;
		this.bucketName = bucket;
		this.key = key;
		this.newKey = newKey;
	}
	
	@Override
	public void run() {
		cli.copyObject(bucketName, key, bucketName, newKey);
		cli.deleteObject(bucketName, key);
	}

}
