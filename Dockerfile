FROM swift:5.9 as build

WORKDIR /app

COPY . .

RUN swift build -c release

FROM swift:5.9-slim

WORKDIR /app

COPY --from=build /app/.build/release /app

EXPOSE 8080

CMD ["./Run"]
