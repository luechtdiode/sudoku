FROM eclipse-temurin:21-jre-alpine

RUN apk update upgrade

# Create kutu user and group
RUN echo "sudoku:x:1497:1495:user for sudoku:/home:/bin/false" >> /etc/passwd
RUN echo "sudoku:!:1495:" >> /etc/group

WORKDIR /sudoku/
RUN chown sudoku:sudoku /sudoku
RUN mkdir /home/sudoku
RUN chown sudoku:sudoku /home/sudoku
RUN chmod -R g+rwx /home/sudoku

COPY --chown=sudoku:sudoku *.jar /sudoku/app.jar

CMD [ "java", "-cp", ".:app.jar" \
    , "-server" \
    , "--add-opens=java.base/java.io=ALL-UNNAMED" \
    , "--add-opens=java.base/java.util=ALL-UNNAMED" \
    , "--add-opens=java.base/java.lang=ALL-UNNAMED" \
    , "--add-opens=java.base/java.lang.invoke=ALL-UNNAMED" \
    , "--add-opens=java.base/java.net=ALL-UNNAMED" \
    , "--add-opens=java.base/java.nio=ALL-UNNAMED" \
    , "--add-opens=java.base/java.time=ALL-UNNAMED" \
    , "--add-opens=java.base/java.util=ALL-UNNAMED" \
    , "--add-opens=java.base/java.util.concurrent.atomic=ALL-UNNAMED" \
    , "--add-opens=java.base/sun.nio.ch=ALL-UNNAMED" \
    , "--add-opens=java.base/sun.util.calendar=ALL-UNNAMED" \
    , "-XX:+UseZGC" \
    , "-XX:+ZGenerational" \
    , "-XX:MaxRAMPercentage=75.0" \
    , "-XX:+ExitOnOutOfMemoryError" \
    , "-XshowSettings:vm -version" \
    , "ch.seidel.sudoku.Sudoku"]