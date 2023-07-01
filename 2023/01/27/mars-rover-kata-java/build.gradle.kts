plugins {
    application
}

repositories {
    mavenCentral()
}

dependencies {
    testImplementation("org.junit.jupiter:junit-jupiter:5.8.2")
    implementation("com.google.guava:guava:31.0.1-jre")
    implementation("net.jqwik:jqwik:1.7.2")
    testImplementation("org.assertj:assertj-core:3.23.1")
}


java.sourceCompatibility = JavaVersion.VERSION_17

tasks.test {
    useJUnitPlatform()
}
