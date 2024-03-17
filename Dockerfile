FROM rust:slim as builder
RUN --mount=type=cache,target=/var/cache/apt \
    apt-get update && apt-get install pkg-config libssl-dev -y
COPY ./Cargo.lock ./Cargo.toml /app/
COPY ./src /app/src
WORKDIR /app
RUN cargo build --release

# Strip final image to bare necessities
FROM gcr.io/distroless/cc-debian12
ENV MK_HELLO_API_HOST=0.0.0.0
COPY --from=builder /app/target/release/hello-api /

CMD ["./hello-api"]
