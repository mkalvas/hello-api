FROM rust:slim as builder
COPY . /app
WORKDIR /app
RUN apt-get update && apt-get install pkg-config libssl-dev -y
RUN cargo build --release

# Strip final image to bare necessities
FROM gcr.io/distroless/cc-debian12
COPY --from=builder /app/target/release/hello-api /

CMD ["./hello-api"]
