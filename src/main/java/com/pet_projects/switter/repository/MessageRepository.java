package com.pet_projects.switter.repository;

import com.pet_projects.switter.domain.Message;
import com.pet_projects.switter.domain.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;

public interface MessageRepository extends CrudRepository<Message, Long> {

    Page<Message> findAll(Pageable pageable);

    Page<Message> findByTag(String tag, Pageable pageable);

    Page<Message> findByAuthor(User user, Pageable pageable);
}
