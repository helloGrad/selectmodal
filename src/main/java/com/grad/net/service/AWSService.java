package com.grad.net.service;

import java.io.File;

import org.springframework.stereotype.Service;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.PutObjectRequest;

@Service
public class AWSService {
    private static final String BUCKET_NAME = "elasticbeanstalk-ap-northeast-2-563282106598";
    private static final String ACCESS_KEY = "AKIAJ6KJ7S6IE6GE5U6A";
    private static final String SECRET_KEY = "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";
    private AmazonS3 amazonS3;
 
//    public AWSService() {
//        
//    }
 
    public void uploadFile(File file) {
    	if(file != null) {
    		AWSCredentials awsCredentials = new BasicAWSCredentials(ACCESS_KEY, SECRET_KEY);
            amazonS3 = new AmazonS3Client(awsCredentials);
    	}
    	
        if (amazonS3 != null) {
            try {
                PutObjectRequest putObjectRequest =
                        new PutObjectRequest(BUCKET_NAME + "/grad-image"/*sub directory*/, file.getName(), file);
                
                putObjectRequest.setCannedAcl(CannedAccessControlList.PublicRead); // file permission
                amazonS3.putObject(putObjectRequest); // upload file
                System.out.println("aws - " + BUCKET_NAME + "/grad-image"/*sub directory*/+file.getName() );
            } catch (AmazonServiceException ase) {
                ase.printStackTrace();
            } finally {
                amazonS3 = null;
            }
        }else {
        	System.out.println("아마존 실패");
        }
    }
}


