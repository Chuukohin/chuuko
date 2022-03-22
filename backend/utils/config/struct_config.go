package config

type Config struct {
	PostgresLink  string
	AutoMigration bool

	Cors []string
}
