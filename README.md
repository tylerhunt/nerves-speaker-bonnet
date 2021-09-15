# Nerves Speaker Bonnet Example

A bare-bones Nerves project showing the changes required to get the [Adafruit
Stereo Speaker Bonnet][bonnet] working with a Raspberry Pi Zero.

[bonnet]: https://www.adafruit.com/product/3346

## Supported Targets

This example is only intended for use with the `rpi0` target.

## Getting Started

To start your Nerves app:

  * `export MIX_TARGET=rpi0` or prefix every command with `MIX_TARGET=rpi0`
  * Install dependencies with `mix deps.get`
  * Create firmware with `mix firmware`
  * Burn to an SD card with `mix firmware.burn`
