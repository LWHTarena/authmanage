package com.peaceful.auth.center.domain;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.util.*;

/**
 * Created by wangjun on 14-4-15.
 */
@Entity(name = "t_role")
public class DJRole implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Integer id;
    public String name;
    public String operator;
    @Column(name = "is_del")
    public int isDel;
    public String description;
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    @Column(name = "create_time")
    public Date createTime;
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    @Column(name = "update_time")
    public Date updateTime = new Date();
    @ManyToOne(cascade = {CascadeType.MERGE})
    public DJSystem system = new DJSystem();
    @ManyToMany(mappedBy = "roles")
    public Set<DJUser> users = new HashSet<DJUser>();
    @ManyToMany(cascade = CascadeType.PERSIST)
    @JoinTable(
            name = "t_function_role",
            inverseJoinColumns = {@JoinColumn(name = "functions_id")},
            joinColumns = {@JoinColumn(name = "roles_id")}
    )
    public Set<DJFunction> functions = new HashSet<DJFunction>();
    @ManyToMany(mappedBy = "roles")
    public Set<DJResource> resources = new HashSet<DJResource>();

    public DJRole() {

    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public int getIsDel() {
        return isDel;
    }

    public void setIsDel(int isdel) {
        this.isDel = isdel;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public DJSystem getSystem() {
        return system;
    }

    public void setSystem(DJSystem system) {
        this.system = system;
    }

    public Set<DJUser> getUsers() {
        return users;
    }

    public void setUsers(Set<DJUser> users) {
        this.users = users;
    }

    public Set<DJFunction> getFunctions() {
        return functions;
    }

    public void setFunctions(Set<DJFunction> functions) {
        this.functions = functions;
    }

    public Set<DJResource> getResources() {
        return resources;
    }

    public void setResources(Set<DJResource> resources) {
        this.resources = resources;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof DJRole)) return false;

        DJRole role = (DJRole) o;

        if (id != null ? !id.equals(role.id) : role.id != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        return id != null ? id.hashCode() : 0;
    }


}
