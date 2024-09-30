FROM golang:1.20 AS builder

WORKDIR /app

COPY . .

RUN go build -o ./bin/loxi-cloud-controller-manager ./cmd

FROM networkstatic/iperf3:latest

COPY --from=builder /app/bin/loxi-cloud-controller-manager /bin/loxi-cloud-controller-manager

USER root
RUN chmod +x /bin/loxi-cloud-controller-manager
