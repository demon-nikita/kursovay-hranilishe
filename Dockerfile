FROM d0fb42e10946/dimonnikita
MAINTAINER "Nikita-dimon" <nikitos.u@mail.ru>

EXPOSE 80 443

CMD ["docker run -itp 80:80 d0fb42e10946/dimonnikita"]
