#!/bin/bash

EVERNOTE_SDK_DIR=./evernote-sdk
EVERNOTE_THRIFT_DIR=./evernote-thrift/src

rm -rf $EVERNOTE_SDK_DIR/*h
rm -rf $EVERNOTE_SDK_DIR/*cpp
thrift --gen cpp -o $EVERNOTE_SDK_DIR $EVERNOTE_THRIFT_DIR/UserStore.thrift
thrift --gen cpp -o $EVERNOTE_SDK_DIR $EVERNOTE_THRIFT_DIR/NoteStore.thrift
thrift --gen cpp -o $EVERNOTE_SDK_DIR $EVERNOTE_THRIFT_DIR/Types.thrift
thrift --gen cpp -o $EVERNOTE_SDK_DIR $EVERNOTE_THRIFT_DIR/Limits.thrift
thrift --gen cpp -o $EVERNOTE_SDK_DIR $EVERNOTE_THRIFT_DIR/Errors.thrift

mv -f $EVERNOTE_SDK_DIR/gen-cpp/*.* $EVERNOTE_SDK_DIR
rm -rf $EVERNOTE_SDK_DIR/gen-cpp
