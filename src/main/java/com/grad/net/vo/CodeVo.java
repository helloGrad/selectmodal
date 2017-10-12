package com.grad.net.vo;

public class CodeVo {
	

	private String cdId;
	private String cdNm;
	private String engCodeNm;
	private String cdDstnct;	
	private String prntsCdId;
	private String prntsCdNm;
	private int gradIngCount;
	private int gradEndCount;
	private int labIngCount;
	private int labEndCount;
	private Long prntsNo;
	
	
	
	
	public String getCdId() {
		return cdId;
	}
	public void setCdId(String cdId) {
		this.cdId = cdId;
	}
	public String getCdNm() {
		return cdNm;
	}
	public void setCdNm(String cdNm) {
		this.cdNm = cdNm;
	}
	public String getEngCodeNm() {
		return engCodeNm;
	}
	public void setEngCodeNm(String engCodeNm) {
		this.engCodeNm = engCodeNm;
	}
	public String getCdDstnct() {
		return cdDstnct;
	}
	public void setCdDstnct(String cdDstnct) {
		this.cdDstnct = cdDstnct;
	}
	public String getPrntsCdId() {
		return prntsCdId;
	}
	public void setPrntsCdId(String prntsCdId) {
		this.prntsCdId = prntsCdId;
	}
	public String getPrntsCdNm() {
		return prntsCdNm;
	}
	public void setPrntsCdNm(String prntsCdNm) {
		this.prntsCdNm = prntsCdNm;
	}
	public int getGradIngCount() {
		return gradIngCount;
	}
	public void setGradIngCount(int gradIngCount) {
		this.gradIngCount = gradIngCount;
	}
	public int getGradEndCount() {
		return gradEndCount;
	}
	public void setGradEndCount(int gradEndCount) {
		this.gradEndCount = gradEndCount;
	}
	public int getLabIngCount() {
		return labIngCount;
	}
	public void setLabIngCount(int labIngCount) {
		this.labIngCount = labIngCount;
	}
	public int getLabEndCount() {
		return labEndCount;
	}
	public void setLabEndCount(int labEndCount) {
		this.labEndCount = labEndCount;
	}
	
	public Long getPrntsNo() {
		return prntsNo;
	}
	public void setPrntsNo(Long prntsNo) {
		this.prntsNo = prntsNo;
	}
	
	
	@Override
	public String toString() {
		return "CodeVo [cdId=" + cdId + ", cdNm=" + cdNm + ", engCodeNm=" + engCodeNm + ", cdDstnct=" + cdDstnct
				+ ", prntsCdId=" + prntsCdId + ", prntsCdNm=" + prntsCdNm + ", gradIngCount=" + gradIngCount
				+ ", gradEndCount=" + gradEndCount + ", labIngCount=" + labIngCount + ", labEndCount=" + labEndCount
				+ ", prntsNo=" + prntsNo + "]";
	}
	
	
}
