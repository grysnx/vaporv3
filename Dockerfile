FROM swift:5.9 as builder

WORKDIR /app

COPY . .
RUN swift build -c release

FROM swift:5.9-slim

WORKDIR /app

COPY --from=builder /app/.build/release /app
COPY --from=builder /app/Public /app/Public
COPY --from=builder /app/Resources /app/Resources

EXPOSE 8080
CMD ["./Run"]
