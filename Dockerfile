FROM busybox:musl

ENV USER=http
ENV GROUPNAME=$USER
ENV UID=11111
ENV GID=22222

COPY src/index.html entrypoint.sh /
RUN chmod 707 entrypoint.sh

RUN addgroup \
    --gid "$GID" \
    "$GROUPNAME" \
&&  adduser \
    --disabled-password \
    --gecos "" \
    --home "$(pwd)" \
    --ingroup "$GROUPNAME" \
    --no-create-home \
    --uid "$UID" \
    $USER

USER http

CMD ["./entrypoint.sh"]
ENTRYPOINT [ "sh" ]