OHJEET_IN = $(wildcard content/ohjeet/*.in)
OHJEET_OUT = $(patsubst content/ohjeet/%.in,output/ohjeet/%.html,$(OHJEET_IN))
PALVELUT_IN = $(wildcard content/palvelut/*.in)
PALVELUT_OUT = $(patsubst content/palvelut/%.in,output/palvelut/%.html,$(PALVELUT_IN))

all: html

output/ohjeet:
	mkdir -p output/ohjeet
output/palvelut:
	mkdir -p output/palvelut

output/ohjeet/%.html: content/ohjeet/%.in template-head.html template-tail.html output/ohjeet
	cat template-head.html $< template-tail.html > $@

output/palvelut/%.html: content/palvelut/%.in template-head.html template-tail.html output/palvelut
	cat template-head.html $< template-tail.html > $@


html: $(OHJEET_OUT) $(PALVELUT_OUT)

clean:
	rm -f $(OHJEET_OUT) $(PALVELUT_OUT)
