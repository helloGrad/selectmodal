package com.grad.net;


import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.GetObjectRequest;
import com.amazonaws.services.s3.model.S3Object;
import com.amazonaws.services.s3.model.S3ObjectInputStream;
import com.amazonaws.util.IOUtils;
import com.grad.net.service.ApndngFileService;
import com.grad.net.vo.ApndngFileVo;


@Controller
public class ApndngFileController {
	

	/*
	 * 허규준, 첨부파일 업로드 및 다운로드 
	 */
	
	@Autowired
	private ApndngFileService apndngFileService;
	
	@RequestMapping("/form")
	public String form(){
		return "form";
	}
	
	@RequestMapping(value = "/upload", method=RequestMethod.POST)
	public String upload(  @RequestParam(value="email", required=true, defaultValue="") String email,
							@RequestParam(value="file1") MultipartFile file1, Model model){
		
		
		String url1 = apndngFileService.restore(file1);
		model.addAttribute("url1",url1);
		
		return "result";
	}
	
	@RequestMapping("/download")
	public void download(@RequestParam Long no, HttpServletResponse response) throws IOException {

		String bucketName= "elasticbeanstalk-ap-northeast-2-563282106598";

		String ACCESS_KEY = "AKIAJ6KJ7S6IE6GE5U6A";
		String SECRET_KEY = "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";

		ApndngFileVo vo = apndngFileService.getFileInfo(no);


		AWSCredentials credentials = new BasicAWSCredentials(ACCESS_KEY, SECRET_KEY);
		AmazonS3 s3 = new AmazonS3Client(credentials);

		// 파일 업로드 부분 파일 이름과 경로를 동시에 넣어줌.
		//        	 PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, file_path+file_name, createSampleFile());
		//             putObjectRequest.setCannedAcl(CannedAccessControlList.PublicRead); // URL 접근시 권한 읽을수 있도록 설정.
		//             s3.putObject(putObjectRequest);
		//             System.out.println("Uploadinf OK");

		// 파일 다운로드 다운로드 경로와 파일이름 동시 필요. 
		System.out.println("Downloading an object");
		S3Object object = s3.getObject(new GetObjectRequest(bucketName+ "/grad-image", vo.getSaveFileName()));
		System.out.println("Content-Type: "  + object.getObjectMetadata().getContentType());
		S3ObjectInputStream objectContent = object.getObjectContent();

		byte[] fileByte = IOUtils.toByteArray(objectContent);

		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(vo.getApndngFileNm(),"UTF-8")+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);

		response.getOutputStream().flush();
		response.getOutputStream().close();


		////////////////////////////////////////////////**//////////////////////////////////////////////////

		//		ApndngFileVo vo = apndngFileService.getFileInfo(no);
		//		byte fileByte[];
		//		try {
		//			fileByte = FileUtils.readFileToByteArray(new File(vo.getStorgPath()));
		//			response.setContentType("application/octet-stream");
		//		    response.setContentLength(fileByte.length);
		//		    response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(vo.getApndngFileNm(),"UTF-8")+"\";");
		//		    response.setHeader("Content-Transfer-Encoding", "binary");
		//		    response.getOutputStream().write(fileByte);
		//		     
		//		    response.getOutputStream().flush();
		//		    response.getOutputStream().close();
		//
		//		} catch (IOException e) {
		//			e.printStackTrace();
		//		}


	}
	
}
