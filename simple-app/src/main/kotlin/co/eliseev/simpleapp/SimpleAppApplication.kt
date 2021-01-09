package co.eliseev.simpleapp

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@SpringBootApplication
@RestController
class SimpleAppApplication {
    @GetMapping
    fun hello() = "HelloWorld"
}

fun main(args: Array<String>) {
    runApplication<SimpleAppApplication>(*args)
}
