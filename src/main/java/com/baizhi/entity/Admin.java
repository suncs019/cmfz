package com.baizhi.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import javax.persistence.Id;
import javax.persistence.Table;

@Data
@Table(name = "admin")
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class Admin {
    @Id
    private String id;
    private String username;
    private String password;
    private String nickname;
}
