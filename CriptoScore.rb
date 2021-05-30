file = File.new("criptoscore.log", 'a')
file.write(Time.now, "\n")

print "Calculador de score para criptomoedas
                        por Milo Draco
                        v. 0.91\n"
loop do

# inputs
print "\nInsira o nome da moeda: "
name = (gets.chomp).upcase
print "Insira o valor atual da moeda em R$: "
value = (gets.chomp).to_f
print "Insira o crescimento em % nos últimos 3 meses: "
c3 = (gets.chomp).to_f
print "Insira o crescimento em % nos últimos 6 meses: "
c6 = gets.chomp
print "Insira o crescimento em % nos últimos 12 meses: "
c12 = gets.chomp
if c6 == "" || c12 == ""
  nohist = true
  else
  nohist = false
end
c6 = c6.to_f
c12 = c12.to_f
print "Insira o saldo das dez últimas notícias (boas-ruins) dentro
dos últimos 3 meses: "
news = (gets.chomp).to_i

# cálculos
svalue = ((Math::log((10**10)-value) - 23.0258) * 25000)**(10)
if nohist == true
  volat = 10
  else
  volat = (((c3 * 2) - c6).abs + ((c6 * 2) - c12).abs)**0.25
end
fator = 5.5 + volat
if fator < 7
  fator = 7
  elsif fator > 21
  fator = 21
end
#puts "\n", fator
cresc = ((c3 + c6 + c12)/fator).abs**(1.0/3) * 2
cresc *= -1 if c3+c6+c12 < 0
score = (cresc + svalue + news - volat).round(2)

# resultado
print "\nValor: #{svalue.round(2)}"
if svalue > 10
  print " (excelente!)\n"
  elsif svalue > 7
  print " (bom)\n"
  elsif svalue > 4
  print " (razoável)\n"
  elsif svalue > 0
  print " (ruim)\n"
  else
  print " (muito ruim!)\n"
end
print "Crescimento: #{cresc.round(2)}"
if cresc > 15
  print " (excelente!)\n"
  elsif cresc > 10
  print " (bom)\n"
  elsif cresc > 5
  print " (razoável)\n"
  elsif cresc > 0
  print " (baixo)\n"
  else
  print " (negativo!)\n"
end
print "Volatilidade: #{volat.round(2)}"
if volat > 10
  print " (muito alta!)\n"
  elsif volat > 7
  print " (alta)\n"
  elsif volat > 4
  print " (razoável)\n"
  elsif volat > 0
  print " (estável)\n"
  else
  print " (nula!)\n"
end
print "Notícias: #{news.round}"
if news >= 10
  print " (promissoras!)\n"
  elsif news > 7
  print " (boas)\n"
  elsif news > 4
  print " (razoáveis)\n"
  elsif news > 0
  print " (ruins)\n"
  else
  print " (péssimas!)\n"
end
print "Score final: #{score}"
if score > 30
  print result = " (investimento altamente recomendável!)"
  elsif score > 20
  print result = " (investimento recomendável)"
  elsif score > 10
  print result = " (razoável)"
  elsif score > 5
  print result = " (ruim)"
  else
  print result = " (não recomendado!)"
end
print "\n"
file.write("#{name} (R$ #{value}): #{score} #{result}", "\n")
print "\nCalcular outra criptomoeda? (s/n) "
lp = (gets.chomp).upcase
file.write("\n") if lp == "N"
exit if lp == "N"
end
