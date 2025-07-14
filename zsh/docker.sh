dkup() {
    docker compose up
}

dkdw() {
    docker compose down
}

dksh() {
    docker exec -it $1 bash
}

dknls() {
    docker network ls
}
