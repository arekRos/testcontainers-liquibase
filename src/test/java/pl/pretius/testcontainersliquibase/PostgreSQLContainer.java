package pl.pretius.testcontainersliquibase;


import liquibase.Liquibase;
import liquibase.database.Database;
import liquibase.database.DatabaseFactory;
import liquibase.database.jvm.JdbcConnection;
import liquibase.exception.DatabaseException;
import liquibase.resource.ClassLoaderResourceAccessor;
import liquibase.resource.ResourceAccessor;
import org.springframework.boot.jdbc.DataSourceBuilder;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class PostgreSQLContainer extends org.testcontainers.containers.PostgreSQLContainer<PostgreSQLContainer> {
    private static final String IMAGE_VERSION = "postgres:15.1";
    private static PostgreSQLContainer container;

    private PostgreSQLContainer() {
        super(IMAGE_VERSION);
        withReuse(false);
    }

    public static PostgreSQLContainer getInstance() {
        if (container == null) {
            container = new PostgreSQLContainer().withReuse(false);
        }
        return container;
    }

    @Override
    public void start() {
        //changelog location
        final String CHANGELOG_FILE = "db/changelog/db.changelog-master.yaml";

        //ds
        DataSource ds = DataSourceBuilder.create()
                .driverClassName(container.getDriverClassName())
                .url(container.getJdbcUrl())
                .username(container.getUsername())
                .password(container.getPassword())
                .build();

        try (Connection connection = ds.getConnection()) {
            JdbcConnection jdbcConnection = new JdbcConnection(connection);
            Database db = DatabaseFactory.getInstance().findCorrectDatabaseImplementation(jdbcConnection);

            ResourceAccessor resourceAccessor = new ClassLoaderResourceAccessor(getClass().getClassLoader());

            Liquibase liquiBase = new Liquibase(CHANGELOG_FILE, resourceAccessor, db);
            liquiBase.dropAll();
        } catch (SQLException | DatabaseException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void stop() {
        //do nothing, JVM handles shut down
    }
}
