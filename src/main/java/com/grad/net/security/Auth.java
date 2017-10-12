package com.grad.net.security;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.METHOD, ElementType.TYPE }) 
@Retention(RetentionPolicy.RUNTIME) 
public @interface Auth {
	
	
	Role role() default Role.USER;
	public enum Role {ADMIN, USER }
	
}
