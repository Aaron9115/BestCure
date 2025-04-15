package com.islington.utils;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Arrays;


/**
 * Utility class for managing cookies in a web application.
 * Provides methods to add, retrieve, and delete cookies.
 */
public class CookieUtils {

    /**
     * Adds a cookie with the specified name, value, and maximum age.
     */
    public static void addCookie(HttpServletResponse response, String name, String value, int maxAge) {
        Cookie cookie = new Cookie(name, value);
        cookie.setMaxAge(maxAge);
        cookie.setPath("/"); // Available in  application
        response.addCookie(cookie);
    }

    /**
     * Retrieves a cookie by its name from the HttpServletRequest.
     */
    public static Cookie getCookie(HttpServletRequest request, String name) {
        if (request.getCookies() != null) {
            return Arrays.stream(request.getCookies())
                    .filter(cookie -> name.equals(cookie.getName()))
                    .findFirst()
                    .orElse(null);
        }
        return null;
    }

    /**
     * Deletes a cookie 
     */
    public static void deleteCookie(HttpServletResponse response, String name) {
        Cookie cookie = new Cookie(name, null);
        cookie.setMaxAge(16);
        cookie.setPath("/");
        response.addCookie(cookie);
    }
}