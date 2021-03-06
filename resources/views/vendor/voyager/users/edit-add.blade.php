@extends('voyager::master')

@section('page_title', __('voyager::generic.'.(isset($dataTypeContent->id) ? 'edit' : 'add')).' '.$dataType->display_name_singular)

@section('css')
    <meta name="csrf-token" content="{{ csrf_token() }}">
@stop

@section('page_header')
    <h1 class="page-title">
        <i class="{{ $dataType->icon }}"></i>
        {{ __('voyager::generic.'.(isset($dataTypeContent->id) ? 'edit' : 'add')).' '.$dataType->display_name_singular }}
    </h1>
@stop

@section('content')
    <div class="page-content container-fluid">
        <form class="form-edit-add" role="form"
              action="@if(!is_null($dataTypeContent->getKey())){{ route('voyager.'.$dataType->slug.'.update', $dataTypeContent->getKey()) }}@else{{ route('voyager.'.$dataType->slug.'.store') }}@endif"
              method="POST" enctype="multipart/form-data" autocomplete="off">
            <!-- PUT Method if we are editing -->
            @if(isset($dataTypeContent->id))
                {{ method_field("PUT") }}
            @endif
            {{ csrf_field() }}

            <div class="row">
                <div class="col-md-8">
                    <div class="panel panel-bordered">
                    {{-- <div class="panel"> --}}
                        @if (count($errors) > 0)
                            <div class="alert alert-danger">
                                <ul>
                                    @foreach ($errors->all() as $error)
                                        <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                        @endif

                        <div class="panel-body">
                            {{-- {{dd($dataTypeContent->id)}} --}}

                            @foreach($dataType->rows as $row)
                                
                                {{-- fields that are exempted --}}
                                @php if($row->field == 'password') continue;@endphp
                                @php if($row->field == 'user_belongsto_role_relationship') continue;@endphp
                                @php if($row->field == 'avatar') continue;@endphp

                                @if($row->edit || $row->add)
                                    @if($row->required)

                                        <div class="form-group col-sm-6">
                                            <label for="{{ $row->field }}">{{ $row->display_name }}</label>
                                            <input type="{{ $row->type }}" class="form-control" id="{{ $row->field }}" name="{{ $row->field }}"
                                                value="{{ old($row->field, $dataTypeContent->{$row->field} ?? '') }}">
                                        </div>
                                        
                                    @elseif($row->type == 'select_dropdown')
                                        
                                        <div class="form-group col-sm-6">
                                            <label for="{{ $row->field }}">{{ $row->display_name }}</label>
                                            @php $options = $row->details @endphp
                                            @include('voyager::formfields.select_dropdown')
                                        </div>
                                    
                                    @elseif($row->type == 'relationship')
                                        <div class="form-group col-sm-6">
                                            <label for="{{ $row->field }}">{{ $row->display_name }}</label>
                                            @php
                                                $dataTypeRows = $dataType->{(isset($dataTypeContent->id) ? 'editRows' : 'addRows' )};
                                                $row     = $dataTypeRows->where('field', $row->field)->first();
                                                $options = $row->details;
                                            @endphp
                                                @include('voyager::formfields.user-relationships')
                                        </div>
                                    @else

                                        <div class="form-group col-sm-6">
                                            <label for="{{ $row->field }}">{{ $row->display_name }}</label>
                                            <input @if($row->required == 1) required @endif type="{{ $row->type }}" class="form-control" name="{{ $row->field }}"
                                                value="{{ old($row->field, $dataTypeContent->{$row->field} ?? '') }}">
                                        </div>

                                    @endif
                                @endif

                            @endforeach

                            @can('editRoles', $dataTypeContent)
                                <div class="form-group col-sm-6">
                                        <label>User's Role</label>
                                    @php
                                        $dataTypeRows = $dataType->{(isset($dataTypeContent->id) ? 'editRows' : 'addRows' )};
                                        $row     = $dataTypeRows->where('field', 'user_belongsto_role_relationship')->first();
                                        $options = $row->details;
                                    @endphp
                                    @include('voyager::formfields.user-relationships')
                                </div>
                            @endcan

                            <div class="form-group col-sm-6">
                                <label for="password">{{ __('voyager::generic.password') }}</label>
                                <input type="password" class="form-control" id="password" name="password" 
                                 value="@if(is_null($dataTypeContent->id)) password @endif" autocomplete="new-password">
                                @if(isset($dataTypeContent->password))
                                    <small>{{ __('voyager::profile.password_hint') }}</small>
                                @endif
                            </div>

                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="panel panel panel-bordered panel-warning">
                        <div class="panel-body">
                            <div class="form-group">
                                @if(isset($dataTypeContent->avatar))
                                    <img src="{{ filter_var($dataTypeContent->avatar, FILTER_VALIDATE_URL) ? $dataTypeContent->avatar : Voyager::image( $dataTypeContent->avatar ) }}" style="width:200px; height:auto; clear:both; display:block; padding:2px; border:1px solid #ddd; margin-bottom:10px;" />
                                @endif
                                <input type="file" data-name="avatar" name="avatar">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <button type="submit" class="btn btn-primary pull-right save">
                {{ __('voyager::generic.save') }}
            </button>
        </form>

        <iframe id="form_target" name="form_target" style="display:none"></iframe>
        <form id="my_form" action="{{ route('voyager.upload') }}" target="form_target" method="post" enctype="multipart/form-data" style="width:0px;height:0;overflow:hidden">
            {{ csrf_field() }}
            <input name="image" id="upload_file" type="file" onchange="$('#my_form').submit();this.value='';">
            <input type="hidden" name="type_slug" id="type_slug" value="{{ $dataType->slug }}">
        </form>
    </div>
@stop

@section('javascript')
    <script>
        $('document').ready(function () {
            $('.toggleswitch').bootstrapToggle();
        });
    </script>
@stop
