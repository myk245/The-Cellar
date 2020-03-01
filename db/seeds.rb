# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Wine.destroy_all
User.destroy_all

wineImageArray = [
   "http://t0.gstatic.com/images?q=tbn%3AANd9GcTT3HSlbaOOlIe1kO2mWIWXrJJS-F5uIhZ-dRebS7K87zSv0oHaFYj6Qk-UIlE&usqp=CAc", 
   "http://t0.gstatic.com/images?q=tbn%3AANd9GcRdiHkYUfKM46HmDSDX9sDkTU-ZR9JoFiiOFV2Bp8W_HPHVRaoTjVbZt8eCcSX8bYDzlw80EfY&usqp=CAc",
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR8WvTLSrNdulSN0QDALZLsF4pnAptO5FkavuWAz7SDUMZJmIxg", 
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQsjMRYSYR1SBlW66qjTY3Eu-hQokS-EY78S3fbkwdjdkhIxG_e",
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQPWAn8CP583rpD6yLiwrnowJfP6PE9HDJ3wvrnf8GqJ89bdFX4",
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRfk3yvWvE5oDHfB9nvEhu3Y75M43dzi0_avLdnG9viCwOnC-lf",
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ-VeakfAXfEo3G1OfwbgAGNdXKMeYXCho4pp_psZdeCo9AaglC",
   "https://hips.hearstapps.com/bpc.h-cdn.co/assets/17/30/480x480/square-1501268880-saved-red-blend.jpg?resize=480:*",
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQkj4vrk64VGiTtdch8sFT3TMeH3_19SpH_5a7mklTZ2V97pWOg",
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRQd5F4LejhYc7k2F2d-asc5w_BQpKHvtlef4CxJwfnAF0jxIWc", 
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRDS3leFP-anAMLQ-KWVWCYBS86a3960Rpmkb2IMdh_es_MkBWl", 
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTnhLifl8zfrGgV9O15lvHFuzbdm-3cHPq58UlQXRa8Q-tdwUga", 
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcThERX9fsEvqmxyPcRdBLfCtUz3oH4aG6Ipi3_18otCxzMFvMOt",
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT7QdV8K0hapG1nQ7ShX2y-wkqn2TmGJd6LQ5ZLPNRt8oQ-HtfX",
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcStfkabsvYkKdq1-2t5hSPID6jKZ4UdE8BHznrMLbbhz5mflTre", 
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQVpwL1BfSwvpzChSoQSXv7-mXzUw3Y1XLVcmkGdrLl_9k3p2PD",
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTvE30HnK_WfTRwXsCaXiFaDsqaLs8Ay-qebBCDzL6IvxqbxiO1",
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRDpHtsaHLAU3YVZi2dvplcyOP35q5I7KZ9zvdowwsd8SmWeYRi",
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQZcjg0gKODyW7HtcQfpeG7NBcQQ2Ze9H9cuq6Krp1jkiBk-oHZ",
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQFjtHwHYC-s9Nol3W0mIxL3LScC9sMzDYsdtoHfH5HRgjHSFFl",
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRleDlxe6tnO8LvHnjYGfaBDRKHsfKvZXgpE8Cw1Zt7Mrg5jQNb",
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTo39yU2dMDKtV-oKlZxgpUDnCwudm51XyPNbv9YJWYpmXfr_Uv",
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSFvDGAyEJegAkDworypXcdbAHJB0cvRq5qLq6iZiFe6oAJkC-o",
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTu5z2lBoq7MLM_TBNbKI9mGKbDTkMlAYjQKvs_1pnclCGMFAxJ",
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTu5z2lBoq7MLM_TBNbKI9mGKbDTkMlAYjQKvs_1pnclCGMFAxJ",
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRNvXjgebIxkP90kdrdfI4uu4XsCEPqk6j6NNLBtKlJdrI5hJSt",
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQVzbi1cXH_YTneozbWAcjVNfsNtZD36Vns0bVArj7ye7vJH2aq",
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTl_vjHnu60lbpzPobEiZkR1uZdThjbQCZhDGoNc4nZcTTplVAq",
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRbMpaNVGPknSl4ZHM7hRzPHs-xM9zYBaS1J6680n2y1XQV9pjI", 
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQm3ydJL8mrokYrTsN0jjvScpu67LwX4Kd_JIpURYU0PR1YyLCj",
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQW3ohP8qPWXx36Cwm_deGb3BDA8wlA16yPEvTpZ9CRee5-VBVw",
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSS2d7ZL31QMmWmwCcP3ZucgPP7v6yqkgbMgTgPZbFppxi8NRmZ",
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSPdqZVxBlO3YMEm-33S2nAKOM81olrcHMuaQXwf8mjoQIzANjU",
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSgnCF6ZQ8ehXXpc6Rh7ffhQvzmd8G21UDeYI-X86oAxAEZ3lDi",
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTfMZYaky4zGw-LA9TkJB-GyJvTfAt6Om5GAs3LFrxbdIs5fFlv",
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQSgEq7p5yMdYrFUclEoJGytZJj3VwxgqCWzfiC-KJ-PJQIIum2",
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSAfm9TyFYjn4cb3NkjbKpgInPvLvwEoN3ht73bZLW9VIJiELmS",
   "https://www.citywinemerchant.com/assets/images/products/pictures/DRCDomainedelaRomanee-ContiLaTache1999.png", 
   "http://t0.gstatic.com/images?q=tbn%3AANd9GcTBxb_GMbEP6gj__KGNY0GsnHVs5o1H5tmN9pLzfkiv0R9qg3eGsDhG3EZv-fU8zspfromoAw&usqp=CAc", 
   "http://t0.gstatic.com/images?q=tbn%3AANd9GcQRrpB0kHz_CEQH00jdCa-XOnXcC7IJ8YA7XQd2j4CTwy7-DGM0x2Tjj_fr&usqp=CAc",
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRocs01d4NqMqF8njYcN3_pcPHvJ9iDmGKWtLSupPq_QcKt72sH", 
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTdXuw8yaZmGcsA2YT2899Ev8gg6X5BN0PQGLTn1bSJBMGVppDg", 
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRvSNatAd0Wxts6qfs5k6PicqWv3gznHwt0KOJGFKNLdXenzcVV", 
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTdXuw8yaZmGcsA2YT2899Ev8gg6X5BN0PQGLTn1bSJBMGVppDg", 
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSQvZwauIVB-ueotOPsNWQjB1EOxBjjMK-GTGk8xehdFqPnuHd-", 
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT0Y3ppjvxmK701ZdQbPSgGdgzUTbUo7q56PmdQA926RZRw5bvf", 
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTKuQCW2_a_d1yfFHBXImhIcroxa910ZInBzKfhucOQc4gMHjxS", 
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTdzWPk0lGgoeXUmJmekex6QH7jG4d4ircMHvbKOAr6-_0DvAlt", 
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTquYS3V9ngR-EkFDVQszfQSd98I7-cYhZ_afzhTiE6chf9YYB6", 
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRh2B83prQ3YFirQEaHNJ4gJg6UEtKmNpas_-N7UNxUA6y9LIbR", 
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQmL5Aq61ALFxUs0ZcdM24WBPKVhaEeJainpC_NwCF63u2pKE3v", 
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRDS3leFP-anAMLQ-KWVWCYBS86a3960Rpmkb2IMdh_es_MkBWl", 
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSD6Gl03C9iFVJlwEH0XpRrsayX8-senJh9D6vwOBH2clNwQ7U0", 
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQPWAn8CP583rpD6yLiwrnowJfP6PE9HDJ3wvrnf8GqJ89bdFX4", 
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ-VeakfAXfEo3G1OfwbgAGNdXKMeYXCho4pp_psZdeCo9AaglC", 
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT-im3Ew8gEEcsd6fflxe4Uj9TblPpRK4lP6A64peuPH_FkwyR4", 
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQn_K7mqh6OeWPXKDSSavDkT8s7VnCgn2gUyRyrRb8DL6jZK_6W", 
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTsVtmil42NkEhiHpy1RKyZ6oaqVePC5A4WfogzjGQhY_o-0l8j", 
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQf33xubpH6WJRO5C9ovhGvhtRQCSbC6neAJjIb6-aj3-tahjaX", 
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTyBXIsfE2kMiVaaInKDkd0V6pgT4vAacqb95-3eLmtPyEJP8eM",
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTuth15ytsmudlp09NQ504qLiSG8taULUKAkDSMa6BbN_gDdkmJ", 
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRzE0YaAksdVEjszofugkWQsA86o9hvzv4y_vJVAbCcEw4iIGYu", 
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQg0NmQUzgc5SbN9TUhrp8WhrlToA3vzgAHWPTkJWg-nPc--aIy",
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSADHnFHoQ6QhTadjknYyrd-gEzmIznWETCd5Ls15ITfZ9VAYMh",
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR4Nfo0YIHVuHY_OwqYuY2BcbyCNfygDySfgN1iVscG-ds4VseN"   
]

100.times do Wine.create(region: ["Burgundy", "Champagne", "Liore", "Piedmont", "Alsace", "Corsica", "Rhone", "Languedoc-Roussillon", "Andalucia", "Castila-La Mancha", "Abruzzo", "Emilia-Romagna", "Chianti", "Veneto", "Brunette di Montalcino", "Bordeaux", "Cachapoal Valley", "Maule Valley", "Maipo Valley", "San Juan", "Mendoza", "Cafayate", "Adelaide Hills", "Mornington Peninsula", "Madeira", "Friuli-Venezia-Giulia", "Molise", "Bolgheri", "Campania", "Beira Interior", "Alentejo", "Sonoma County", "Wild Horse Valley", "Happy Canyon", "Sierra Foothills", "Basilicata"].sample, 
   notes: ["apricot", "cherry", "bergamot", "blackberry", "black currant", "bramble", "cassis", "citrus", "fig", "floral", "vanilla", "tobacco", "chocolate", "honey", "black pepper", "cedar", "smoky", "walnut", "cinnamon", "clove", "caramel"].sample, 
   grapeVariety: ["Cabernet-Sauvignon", "Riesling", "Sangiovese", "Pinot Noir", "Chardonnay", "Merlot", "Sauvignon Blanc", "Syrah", "Zinfandel", "Grenache", "Tempranillo", "Moscato", "Shiraz", "Pinot Grigio", "Chenin Blanc", "Port", "Sherry", "Prosecco", "Malbec", "Montepulciano", "Chianti", "Sangiovese", "Cava", "Brut"].sample, 
   wineType: ["Red", "White", "Sparkling", "Rose"].sample, 
   vintage: [2009, 2000, 1989, 1995, 2004, 2005, 2006, 1988, 1994, 2001, 1992, 2019, 2020, 2018, 2015, 2016, 1993, 1999, 1963, 1961, 2002].sample, 
   label: Faker::Beer.name, 
   price: [45.00, 33.00, 20.00, 23.00, 28.00, 29.00, 65.00, 87.00, 100.00, 200.00, 150.00, 158.00, 68.00, 18.00, 17.00, 15.00, 9.00, 125.00].sample, 
   image: wineImageArray.sample)
end

User.create(name: "TC")