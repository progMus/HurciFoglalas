/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.hataridonaplo;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author java
 * @param <T>
 */
@FunctionalInterface
public interface IResultSet<T> {
    T processResultSet(ResultSet rs) throws SQLException;
}
