package com.pet_projects.switter.domain.util;

import com.pet_projects.switter.domain.User;

public abstract class MessageHelper {
    public static String getAuthorName(User user) {
        return user != null ? user.getUsername() : "<none>";
    }
}
