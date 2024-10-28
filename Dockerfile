FROM eclipse-temurin:21-jre-alpine

RUN apk update upgrade

# Create kutu user and group
RUN echo "sudoku:x:1497:1495:user for sudoku:/home:/bin/false" >> /etc/passwd
RUN echo "sudoku:!:1495:" >> /etc/group

WORKDIR /sudoku/
RUN mkdir /sudoku/input
RUN mkdir /sudoku/output
RUN chown -R sudoku:sudoku /sudoku
RUN mkdir /home/sudoku
RUN chown sudoku:sudoku /home/sudoku
RUN chmod -R g+rwx /home/sudoku

COPY --chown=sudoku:sudoku target/*.jar /sudoku/app.jar
COPY --chown=sudoku:sudoku target/dependency /sudoku/libs


ENTRYPOINT [ "java", "-cp", ".:app.jar:libs/*", "ch.seidel.sudoku.Sudoku"]

# build with docker build -t sudoku:test .
# Run with docker run --rm -it -v $(pwd)/input:/sudoku/input sudoku:test /sudoku/input/sudoku.txt