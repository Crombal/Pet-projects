package com.pet_projects.switter.service;

import com.pet_projects.switter.domain.User;
import com.pet_projects.switter.domain.dto.MessageDto;
import com.pet_projects.switter.repository.MessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;

@Service
public class MessageService {
    @Autowired
    private MessageRepository messageRepository;

    public Page<MessageDto> messageList(Pageable pageable, String filter, User user) {

        if (filter != null && !filter.isEmpty()) {
            return messageRepository.findByTag(filter, pageable, user);
        } else {
            return messageRepository.findAll(pageable, user);
        }

    }

    public Page<MessageDto> messageListForUser(Pageable pageable, User author, User user) {

        return messageRepository.findByUser(pageable, author, user);
    }
}
