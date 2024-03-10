use axum::{routing::get, Router};

#[tokio::main]
async fn main() {
    let app = Router::new().route("/", get(hello));
    let host = std::env::var("HELLO_API_HOST").unwrap_or("127.0.0.1".into());
    let listener = tokio::net::TcpListener::bind(format!("{host}:3000"))
        .await
        .unwrap();

    axum::serve(listener, app).await.unwrap();
}

async fn hello() -> &'static str {
    "Hello, World!"
}

/// just illustrative
#[cfg(test)]
mod test {
    #[tokio::test]
    async fn hello_response() {
        assert_eq!(super::hello().await, "Hello, World!");
    }
}
