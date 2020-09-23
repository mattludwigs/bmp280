defmodule BMP280.Calibration do
  @moduledoc false

  defstruct [
    :has_humidity?,
    :dig_T1,
    :dig_T2,
    :dig_T3,
    :dig_P1,
    :dig_P2,
    :dig_P3,
    :dig_P4,
    :dig_P5,
    :dig_P6,
    :dig_P7,
    :dig_P8,
    :dig_P9,
    :dig_H1,
    :dig_H2,
    :dig_H3,
    :dig_H4,
    :dig_H5
  ]

  @type uint16() :: 0..65535
  @type int16() :: -32768..32767
  @type uint8() :: 0..255
  @type int12() :: -2048..2047

  @type t() :: %__MODULE__{
          has_humidity?: boolean(),
          dig_T1: uint16(),
          dig_T2: int16(),
          dig_T3: int16(),
          dig_P1: uint16(),
          dig_P2: int16(),
          dig_P3: int16(),
          dig_P4: int16(),
          dig_P5: int16(),
          dig_P6: int16(),
          dig_P7: int16(),
          dig_P8: int16(),
          dig_P9: int16(),
          dig_H1: uint8(),
          dig_H2: int16(),
          dig_H3: uint8(),
          dig_H4: int12(),
          dig_H5: int12()
        }

  @spec from_binary(<<_::192>> | <<_::240>>) :: BMP280.Calibration.t()
  def from_binary(
        <<dig_T1::little-16, dig_T2::little-signed-16, dig_T3::little-signed-16,
          dig_P1::little-16, dig_P2::little-signed-16, dig_P3::little-signed-16,
          dig_P4::little-signed-16, dig_P5::little-signed-16, dig_P6::little-signed-16,
          dig_P7::little-signed-16, dig_P8::little-signed-16, dig_P9::little-signed-16>>
      ) do
    %__MODULE__{
      has_humidity?: false,
      dig_T1: dig_T1,
      dig_T2: dig_T2,
      dig_T3: dig_T3,
      dig_P1: dig_P1,
      dig_P2: dig_P2,
      dig_P3: dig_P3,
      dig_P4: dig_P4,
      dig_P5: dig_P5,
      dig_P6: dig_P6,
      dig_P7: dig_P7,
      dig_P8: dig_P8,
      dig_P9: dig_P9
    }
  end

  def from_binary(
        <<dig_T1::little-16, dig_T2::little-signed-16, dig_T3::little-signed-16,
          dig_P1::little-16, dig_P2::little-signed-16, dig_P3::little-signed-16,
          dig_P4::little-signed-16, dig_P5::little-signed-16, dig_P6::little-signed-16,
          dig_P7::little-signed-16, dig_P8::little-signed-16, dig_P9::little-signed-16, dig_H1,
          dig_H2::signed-16, dig_H3, dig_H4::12, dig_H5::little-12>>
      ) do
    %__MODULE__{
      has_humidity?: true,
      dig_T1: dig_T1,
      dig_T2: dig_T2,
      dig_T3: dig_T3,
      dig_P1: dig_P1,
      dig_P2: dig_P2,
      dig_P3: dig_P3,
      dig_P4: dig_P4,
      dig_P5: dig_P5,
      dig_P6: dig_P6,
      dig_P7: dig_P7,
      dig_P8: dig_P8,
      dig_P9: dig_P9,
      dig_H1: dig_H1,
      dig_H2: dig_H2,
      dig_H3: dig_H3,
      dig_H4: dig_H4,
      dig_H5: dig_H5
    }
  end
end
