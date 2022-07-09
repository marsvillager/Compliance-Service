package com.siemens.osa.data.cs.config;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeException;

import java.sql.*;

public class ArrayTypeHandler extends BaseTypeHandler<Object[]> {

    private static final String ARRAY_TYPE_INTEGER = "integer";
    private static final String ARRAY_TYPE_VARCHAR = "varchar";
    private static final String ARRAY_TYPE_NUMERIC = "numeric";
    private static final String ARRAY_TYPE_BOOLEAN = "boolean";

    @Override
    public void setNonNullParameter(PreparedStatement preparedStatement, int i, Object[] objects, JdbcType jdbcType) throws SQLException {
        String typeName=null;
        if (objects instanceof Integer[]) {
            typeName = ARRAY_TYPE_INTEGER;
        } else if (objects instanceof String[]) {
            typeName = ARRAY_TYPE_VARCHAR;
        } else if (objects instanceof Double[]) {
            typeName = ARRAY_TYPE_NUMERIC;
        }else if (objects instanceof Boolean[]) {
            typeName = ARRAY_TYPE_BOOLEAN;
        }

        if (typeName == null) {
            throw new TypeException(objects.getClass().getName()+" can not match a array-type");
        }

        Connection connection = preparedStatement.getConnection();
        Array array = connection.createArrayOf(typeName, objects);
        preparedStatement.setArray(i, array);
    }

    @Override
    public Object[] getNullableResult(ResultSet resultSet, String s) throws SQLException {
        return getArray(resultSet.getArray(s));
    }

    @Override
    public Object[] getNullableResult(ResultSet resultSet, int i) throws SQLException {
        return getArray(resultSet.getArray(i));
    }

    @Override
    public Object[] getNullableResult(CallableStatement callableStatement, int i) throws SQLException {
        return getArray(callableStatement.getArray(i));
    }

    private Object[] getArray(Array array) {
        if (array == null) {
            return null;
        }
        try {
            return (Object[]) array.getArray();
        } catch (Exception e) {
        }
        return null;
    }
}

