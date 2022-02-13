/*
  Copyright (C) 2021 Joshua Wade

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

part of 'generator_row_cubit.dart';

@immutable
class GeneratorRowState {
  final int generatorID;
  final int projectID;
  final Optional<PatternModel> pattern;
  final Color color;
  final List<ClipNoteModel> clipNotes;

  const GeneratorRowState({
    required this.generatorID,
    required this.projectID,
    required this.pattern,
    required this.color,
    this.clipNotes = const [],
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GeneratorRowState &&
          other.generatorID == generatorID &&
          other.projectID == projectID &&
          other.pattern == pattern &&
          other.color == color &&
          other.clipNotes == clipNotes;

  @override
  int get hashCode =>
      generatorID.hashCode ^
      projectID.hashCode ^
      pattern.hashCode ^
      color.hashCode ^
      clipNotes.hashCode;

  GeneratorRowState copyWith({
    int? generatorID,
    int? projectID,
    Optional<PatternModel>? pattern,
    Color? color,
    List<ClipNoteModel>? clipNotes,
  }) {
    return GeneratorRowState(
      generatorID: generatorID ?? this.generatorID,
      projectID: projectID ?? this.projectID,
      pattern: pattern ?? this.pattern,
      color: color ?? this.color,
      clipNotes: clipNotes ?? this.clipNotes,
    );
  }
}
