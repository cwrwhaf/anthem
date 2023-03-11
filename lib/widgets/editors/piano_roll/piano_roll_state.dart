/*
  Copyright (C) 2021 - 2022 Joshua Wade

  This file is part of Anthem.

  Anthem is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  Anthem is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
  General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with Anthem. If not, see <https://www.gnu.org/licenses/>.
*/

part of 'piano_roll_cubit.dart';

// Workaround for https://github.com/rrousselGit/freezed/issues/653
@Freezed(makeCollectionsUnmodifiable: false)
class PianoRollState with _$PianoRollState {
  factory PianoRollState({
    required ID projectID,
    ID? patternID,
    required int ticksPerQuarter,
    ID? activeInstrumentID,
    required double keyHeight,
    required double keyValueAtTop,
    required int lastContent, // tick position of the last note end
    @Default(false) hasTimeMarkers,
  }) = _PianoRollState;
}
