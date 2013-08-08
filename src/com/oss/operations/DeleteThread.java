package com.oss.operations;

import com.aliyun.openservices.oss.OSSClient;

public class DeleteThread implements Runnable {
	private OSSClient cli = null;
	private String bucketName = "";
	private String key = "";
	
	public DeleteThread(OSSClient client, String bucket, String key) {
		this.cli = client;
		this.bucketName = bucket;
		this.key = key;
	}
	@Override
	public void run() {
		cli.deleteObject(bucketName, key);
	}

}
