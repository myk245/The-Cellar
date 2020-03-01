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
   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQg0NmQUzgc5SbN9TUhrp8WhrlToA3vzgAHWPTkJWg-nPc--aIy"   
]

25.times do Wine.create(region: ["Burgundy", "Champagne", "Liore", "Piedmont", "Alsace", "Rhone", "Languedoc-Roussillon"].sample, notes: ["fruity", "floral", "vanilla", "tobacco"].sample, grapeVariety: ["Cabernet-Sauvignon", "Riesling", "Sangiovese", "Pinot Noir"].sample, wineType: ["Red", "White", "Sparkling", "Rose"].sample, vintage: [2009, 2000, 1989, 1995, 2004, 1988, 1994, 2001].sample, label: Faker::Beer.name, price: [45.00, 33.00, 29.00, 65.00, 87.00].sample, image: wineImageArray.sample)
end

User.create(name: "TC")