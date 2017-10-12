package com.grad.net.vo;

public class FileVo {
	

		private String name;
		private Long size;
		private String type;
		private String lastModifiedDate;
		
		
		
		
		
		public String getLastModifiedDate() {
			return lastModifiedDate;
		}
		public void setLastModifiedDate(String lastModifiedDate) {
			this.lastModifiedDate = lastModifiedDate;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public Long getSize() {
			return size;
		}
		public void setSize(Long size) {
			this.size = size;
		}
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
		}
		
		
		@Override
		public String toString() {
			return "FileVo [name=" + name + ", size=" + size + ", type=" + type + ", lastModifiedDate="
					+ lastModifiedDate + "]";
		}
		
		
		
	
		
}
		