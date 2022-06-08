package config

type Config struct {
	PostgresLink  string
	AutoMigration bool
	JwtSecret     string
	InternalIP    string
	AdminToken    string

	Cors []string
}
