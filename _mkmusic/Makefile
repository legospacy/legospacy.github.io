# --- Directories and files --- #
MUSIC_SRC_DIR =  $(HOME)/sync/work/music/music
OPENMPT_SRC_DIR = $(realpath $(MUSIC_SRC_DIR)/openmpt/publish)
SUNVOX_SRC_DIR = $(realpath $(MUSIC_SRC_DIR)/sunvox/publish)

WORK_DIR ?= $(HOME)/Dropbox/Public/music

DEPLOY_METADATA_DIR ?= ../_data

# ---

$(shell mkdir -p $(WORK_DIR))


# --- Programs --- #
OPENMPT123_FLAGS = --no-float


# --- Source files --- #
INPUT_FILES ?= $(wildcard $(OPENMPT_SRC_DIR)/*.it) \
	$(wildcard $(OPENMPT_SRC_DIR)/*.mptm) \
	$(wildcard $(SUNVOX_SRC_DIR)/*.sunvox)

SOURCES = $(foreach file,$(INPUT_FILES),$(WORK_DIR)/$(notdir $(file)))

METAFILES = $(foreach file,$(SOURCES),$(file).meta)


# --- Output files --- #
WAVS = $(foreach file,$(SOURCES),$(file).wav)
FLACS = $(subst .wav,.flac,$(WAVS))
OGGS = $(subst .wav,.ogg,$(WAVS))

METADATA_FILE = $(WORK_DIR)/music.yaml


# --- Targets --- #
.PHONY: all sources flacs oggs metadata-file deploy deploy-music deploy-metadata-file clean

# ---

all: deploy

# ---

sources: $(SOURCES)

flacs: $(FLACS)

oggs: $(OGGS)

metadata-file: $(METADATA_FILE)

# ---

deploy: deploy-music deploy-metadata-file

deploy-music: $(SOURCES) $(FLACS) $(OGGS)
	@#rsync -av $(foreach file,$(SOURCES) $(FLACS) $(OGGS),"$(file)") $(DEPLOY_MUSIC_DIR)

deploy-metadata-file: $(METADATA_FILE)
	cp $(METADATA_FILE) $(DEPLOY_METADATA_DIR)

# --- <> --- #

%.it:
	cp "$(OPENMPT_SRC_DIR)/$(notdir $@)" "$@"

%.mptm:
	cp "$(OPENMPT_SRC_DIR)/$(notdir $@)" "$@"

%.sunvox:
	cp "$(SUNVOX_SRC_DIR)/$(notdir $@)" "$@"

# ---

%.it.meta:
	cp "$(OPENMPT_SRC_DIR)/$(notdir $@)" "$@"

%.mptm.meta:
	cp "$(OPENMPT_SRC_DIR)/$(notdir $@)" "$@"

%.sunvox.meta:
	cp "$(SUNVOX_SRC_DIR)/$(notdir $@)" "$@"

# ---

%.it.wav: %.it
	openmpt123 $(OPENMPT123_FLAGS) --render "$<"

%.mptm.wav: %.mptm
	openmpt123 $(OPENMPT123_FLAGS) --render "$<"

%.sunvox.wav: %.sunvox
	svrender "$<" "$@"

# ---

%.flac: %.wav %.meta
	flac -f $(FLAC_FLAGS) "$<"
	./apply-metafile-tags.lua "$@" "$(subst .wav,.meta,$<)"
	metaflac --add-replay-gain "$@"


%.ogg: %.flac
	ffmpeg -y -i "$<" -codec:a libvorbis -qscale:a 5 -vn "$@"

# ---

$(METADATA_FILE): $(METAFILES)
	./create-metadata-file.lua "$@" $(foreach file,$^,"$(file)")

# ---

clean:
	$(RM) $(foreach file,$(SOURCES),"$(file)")
	$(RM) $(foreach file,$(METAFILES),"$(file)")
	$(RM) $(foreach file,$(WAVS),"$(file)")
	$(RM) $(foreach file,$(FLACS),"$(file)")
	$(RM) $(foreach file,$(OGGS),"$(file)")
	$(RM) "$(METADATA_FILE)"
