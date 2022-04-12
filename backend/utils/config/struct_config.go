package config

type Config struct {
	PostgresLink  string
	AutoMigration bool
	JwtSecret     string

	Cors []string
}
