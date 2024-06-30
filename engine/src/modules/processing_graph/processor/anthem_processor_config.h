/*
  Copyright (C) 2024 Joshua Wade

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

#pragma once

#include <vector>
#include <memory>
#include <string>

#include "anthem_processor_parameter_config.h"
#include "anthem_processor_port_config.h"

// This class defines properties for an AnthemProcessor. These properties are
// used by the graph to define things like inputs and outputs.
class AnthemProcessorConfig {
private:
  std::vector<std::shared_ptr<AnthemProcessorPortConfig>> audioInputs;
  std::vector<std::shared_ptr<AnthemProcessorPortConfig>> audioOutputs;

  std::vector<std::shared_ptr<AnthemProcessorPortConfig>> midiInputs;
  std::vector<std::shared_ptr<AnthemProcessorPortConfig>> midiOutputs;

  std::vector<std::shared_ptr<AnthemProcessorPortConfig>> controlInputs;
  std::vector<std::shared_ptr<AnthemProcessorPortConfig>> controlOutputs;

  // Should always map 1:1 with controlInputs.
  std::vector<std::shared_ptr<AnthemProcessorParameterConfig>> parameters;

  std::string id;
public:
  AnthemProcessorConfig(const std::string& id) : id(id) {}

  // Gets the index of an audio input port with the given ID.
  const std::optional<unsigned int> getIndexOfAudioInput(unsigned long id) const;

  // Get an audio input port by index.
  const std::shared_ptr<AnthemProcessorPortConfig> getAudioInputByIndex(int index) const;

  // Get the number of audio inputs.
  int getNumAudioInputs() const;

  // Add an audio input port.
  void addAudioInput(const std::shared_ptr<AnthemProcessorPortConfig> port);

  // Gets the index of an audio output port with the given ID.
  const std::optional<unsigned int> getIndexOfAudioOutput(unsigned long id) const;

  // Get an audio output port by index.
  const std::shared_ptr<AnthemProcessorPortConfig> getAudioOutputByIndex(int index) const;

  // Get the number of audio outputs.
  int getNumAudioOutputs() const;

  // Add an audio output port.
  void addAudioOutput(const std::shared_ptr<AnthemProcessorPortConfig> port);

  // Gets the index of a MIDI input port with the given ID.
  const std::optional<unsigned int> getIndexOfMidiInput(unsigned long id) const;

  // Get a MIDI input port by index.
  const std::shared_ptr<AnthemProcessorPortConfig> getMidiInputByIndex(int index) const;

  // Get the number of MIDI inputs.
  int getNumMidiInputs() const;

  // Add a MIDI input port.
  void addMidiInput(const std::shared_ptr<AnthemProcessorPortConfig> port);

  // Gets the index of a MIDI output port with the given ID.
  const std::optional<unsigned int> getIndexOfMidiOutput(unsigned long id) const;

  // Get a MIDI output port by index.
  const std::shared_ptr<AnthemProcessorPortConfig> getMidiOutputByIndex(int index) const;

  // Get the number of MIDI outputs.
  int getNumMidiOutputs() const;

  // Add a MIDI output port.
  void addMidiOutput(const std::shared_ptr<AnthemProcessorPortConfig> port);

  // Gets the index of a control input port with the given ID.
  const std::optional<unsigned int> getIndexOfControlInput(unsigned long id) const;

  // Get a control input port by index.
  const std::shared_ptr<AnthemProcessorPortConfig> getControlInputByIndex(int index) const;

  // Get the number of control inputs.
  int getNumControlInputs() const;

  // Add a control input port.
  void addControlInput(const std::shared_ptr<AnthemProcessorPortConfig> port, const std::shared_ptr<AnthemProcessorParameterConfig> parameter);

  // Gets the index of a control output port with the given ID.
  const std::optional<unsigned int> getIndexOfControlOutput(unsigned long id) const;

  // Get a control output port by index.
  const std::shared_ptr<AnthemProcessorPortConfig> getControlOutputByIndex(int index) const;

  // Get the number of control outputs.
  int getNumControlOutputs() const;

  // Add a control output port.
  void addControlOutput(const std::shared_ptr<AnthemProcessorPortConfig> port);

  // Gets the index of a parameter with the given ID.
  const std::optional<unsigned int> getIndexOfParameter(unsigned long id) const;

  // Get a parameter by index.
  const std::shared_ptr<AnthemProcessorParameterConfig> getParameterByIndex(int index) const;

  std::string getId() {
    return id;
  }
};
