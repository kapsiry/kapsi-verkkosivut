SRCS = $(wildcard content/ohjeet/*.in)
HTMLS = $(patsubst content/ohjeet/%.in,output/ohjeet/%.html,$(SRCS))

output/ohjeet/%.html: content/ohjeet/%.in template-head.html template-tail.html
	mkdir -p output/ohjeet
	cat template-head.html $< template-tail.html > $@

all: html

html: $(HTMLS)

clean:
	rm -f $(HTMLS)
