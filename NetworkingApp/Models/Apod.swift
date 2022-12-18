//
//  apod.swift
//  NetworkingApp
//
//  Created by Irunchik on 13.12.22.
//

struct Apod: Decodable {
    let date: String
    let explanation: String
    let hdurl: String
    let media_type: String
    let service_version: String
    let title: String
    let url: String
}
struct Activity: Decodable {

      let activity: String
      let type: String
      let participants: Int
      let price: Double
      let link:String
      let key: String
      let accessibility: Double

}
//"date": "2022-12-17",
//"explanation": "Get out your red/blue glasses and check out this stereo scene from Taurus-Littrow valley on the Moon! The color anaglyph features a detailed 3D view of Apollo 17's Lunar Rover in the foreground -- behind it lies the Lunar Module and distant lunar hills. Because the world was going to be able to watch the Lunar Module's ascent stage liftoff via the rover's TV camera, this parking place was also known as the VIP Site. Fifty years ago, in December of 1972, Apollo 17 astronauts Eugene Cernan and Harrison Schmitt spent about 75 hours on the Moon, while colleague Ronald Evans orbited overhead. The crew returned with 110 kilograms of rock and soil samples, more than from any of the other lunar landing sites. Cernan and Schmitt are still the last to walk (or drive) on the Moon.",
//"hdurl": "https://apod.nasa.gov/apod/image/2212/a17anaglyph_vanMeijgaarden_f.jpg",
//"media_type": "image",
//"service_version": "v1",
//"title": "Apollo 17 VIP Site Anaglyph",
//"url": "https://apod.nasa.gov/apod/image/2212/a17anaglyph_vanMeijgaarden_1024v.jpg",
