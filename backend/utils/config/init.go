package config

import (
	"gopkg.in/yaml.v3"
	"io/ioutil"
	"log"
)

var C = new(Config)

func init() {

	config, err := ioutil.ReadFile("config.yml")
	if err != nil {
		log.Fatal(err)
	}

	err = yaml.Unmarshal(config, C)

	if err != nil {
		log.Fatal(err)
	}
}
