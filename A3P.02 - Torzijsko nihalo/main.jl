using Measurements, Plots, GLM, DataFrames, CSV, LaTeXStrings, Unitful, Statistics, UnitfulLatexify
function latexDat(x, name)
    name * "," * (LaTeXString(string(ustrip(x))) * latexify(unit(x)))
end
Unitful.preferunits(u"s", u"kg", u"m")
#nihajni časi
t0 = DataFrame(CSV.File("casi.csv"))

#valj
r_vn = (14.4u"mm" ± 0.1u"mm")/2
r_vz = (87.2u"mm" ± 0.1u"mm")/2
h_v = 49.3u"mm" ± 0.1u"mm"
m_v = 2490u"g" ± 1u"g"

#žica
l = 20.8u"cm" ± 0.1u"cm"
r = (0.54u"mm" ± 0.01u"mm")/2
#kvader
a = 60.0u"mm" ± 0.1u"mm"
r_n = (40.2u"mm"± 0.1u"mm")/2
m_k = 1193u"g" ± 1u"g"

#zobnik
m_z = 750u"g" ± 1u"g"
#meritev lastnih nihajnih časov
t_p = (mean(t0[!, "Prazna ploščad"])u"s" ± std(t0[!, "Prazna ploščad"])u"s")/10
t_v = (mean(t0[!, "Valj"])u"s" ± std(t0[!, "Valj"])u"s")/10
t_k = (mean(t0[!, "Kvader"])u"s" ± std(t0[!, "Kvader"])u"s")/10
t_z = (mean(t0[!, "Zobnik"])u"s" ± std(t0[!, "Zobnik"])u"s")/10
#izračun J za votel valj
J_v = 1/2 * m_v*(r_vn^2 + r_vz^2)
#izračun koeficienta J/D iz nihajnih časov
JD_p = (t_p / (2*pi))^2
JD_v = (t_v / (2*pi))^2
JD_k = (t_k / (2*pi))^2
JD_z = (t_z / (2*pi))^2
#izračun D
D = ((JD_v - JD_p)/J_v)^-1
#izračun J plošče in J kvadra z izrezom
J_p = D*JD_p
J_k = (JD_k - JD_p)*D
J_z = (JD_z - JD_p)*D

#izračun teoretičnega J za kvader z izrezom

J_kT = m_k/12 * (a^2 - pi*r_n^2)^-1 * (a^2 * (2*a^2) - 6*pi * r_n^4) 
r_j = sqrt(J_k / m_k)
#G žice 
G = 2*l*D/(pi*r^4)
